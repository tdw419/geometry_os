; DESCRIPTION: Draws a red line from (298, 42) to (248, 240).
; PLAN: r0=298(x1), r1=42(y1), r2=248(x2), r3=240(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 42
LDI r2, 248
LDI r3, 240
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
