; DESCRIPTION: Renders a green box of size 102x83 starting at (305, 20).
; PLAN: r0=305(x), r1=20(y), r2=102(width), r3=83(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 20
LDI r2, 102
LDI r3, 83
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
