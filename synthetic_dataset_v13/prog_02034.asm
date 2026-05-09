; DESCRIPTION: Draws a cyan line from (268, 5) to (492, 55).
; PLAN: r0=268(x1), r1=5(y1), r2=492(x2), r3=55(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 5
LDI r2, 492
LDI r3, 55
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
