; DESCRIPTION: Places a cyan line segment connecting (276, 50) to (295, 21).
; PLAN: r0=276(x1), r1=50(y1), r2=295(x2), r3=21(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 50
LDI r2, 295
LDI r3, 21
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
