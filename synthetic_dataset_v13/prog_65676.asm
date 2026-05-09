; DESCRIPTION: Renders a green box of size 113x56 starting at (303, 50).
; PLAN: r0=303(x), r1=50(y), r2=113(width), r3=56(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 50
LDI r2, 113
LDI r3, 56
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
