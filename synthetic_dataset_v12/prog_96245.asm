; DESCRIPTION: Renders a cyan box of size 25x78 starting at (218, 178).
; PLAN: r0=218(x), r1=178(y), r2=25(width), r3=78(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 178
LDI r2, 25
LDI r3, 78
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
