; DESCRIPTION: Renders a green box of size 50x29 starting at (342, 14).
; PLAN: r0=342(x), r1=14(y), r2=50(width), r3=29(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 14
LDI r2, 50
LDI r3, 29
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
