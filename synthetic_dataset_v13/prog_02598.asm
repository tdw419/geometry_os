; DESCRIPTION: Creates a blue rectangular region at (398, 180) spanning 91 by 10 pixels.
; PLAN: r0=398(x), r1=180(y), r2=91(width), r3=10(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 180
LDI r2, 91
LDI r3, 10
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
