; DESCRIPTION: Renders a green box of size 53x115 starting at (80, 120).
; PLAN: r0=80(x), r1=120(y), r2=53(width), r3=115(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 120
LDI r2, 53
LDI r3, 115
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
