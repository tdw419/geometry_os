; DESCRIPTION: Renders a green box of size 50x79 starting at (198, 96).
; PLAN: r0=198(x), r1=96(y), r2=50(width), r3=79(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 96
LDI r2, 50
LDI r3, 79
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
