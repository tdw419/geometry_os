; DESCRIPTION: Renders a cyan box of size 63x102 starting at (218, 25).
; PLAN: r0=218(x), r1=25(y), r2=63(width), r3=102(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 25
LDI r2, 63
LDI r3, 102
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
