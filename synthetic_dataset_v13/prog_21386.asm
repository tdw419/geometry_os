; DESCRIPTION: Draws a yellow rectangle at (277, 180) with width 50 and height 60.
; PLAN: r0=277(x), r1=180(y), r2=50(width), r3=60(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 180
LDI r2, 50
LDI r3, 60
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
