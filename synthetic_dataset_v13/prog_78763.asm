; DESCRIPTION: Renders a yellow box of size 54x55 starting at (180, 50).
; PLAN: r0=180(x), r1=50(y), r2=54(width), r3=55(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 50
LDI r2, 54
LDI r3, 55
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
