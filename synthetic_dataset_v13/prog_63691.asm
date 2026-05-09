; DESCRIPTION: Renders a green box of size 113x60 starting at (242, 80).
; PLAN: r0=242(x), r1=80(y), r2=113(width), r3=60(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 80
LDI r2, 113
LDI r3, 60
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
