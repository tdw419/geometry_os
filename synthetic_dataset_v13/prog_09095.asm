; DESCRIPTION: Renders a cyan box of size 82x22 starting at (218, 1).
; PLAN: r0=218(x), r1=1(y), r2=82(width), r3=22(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 1
LDI r2, 82
LDI r3, 22
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
