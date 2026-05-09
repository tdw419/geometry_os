; DESCRIPTION: Places a red line segment connecting (349, 239) to (42, 14).
; PLAN: r0=349(x1), r1=239(y1), r2=42(x2), r3=14(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 239
LDI r2, 42
LDI r3, 14
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
