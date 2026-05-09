; DESCRIPTION: Places a cyan line segment connecting (239, 41) to (435, 92).
; PLAN: r0=239(x1), r1=41(y1), r2=435(x2), r3=92(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 41
LDI r2, 435
LDI r3, 92
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
