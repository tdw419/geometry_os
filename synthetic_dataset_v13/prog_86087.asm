; DESCRIPTION: Draws a orange line from (16, 215) to (410, 120).
; PLAN: r0=16(x1), r1=215(y1), r2=410(x2), r3=120(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 215
LDI r2, 410
LDI r3, 120
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
