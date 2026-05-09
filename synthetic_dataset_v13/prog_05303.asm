; DESCRIPTION: Places a orange circle of radius 50 at center (295, 55).
; PLAN: r0=295(x), r1=55(y), r2=50(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 295
LDI r1, 55
LDI r2, 50
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
