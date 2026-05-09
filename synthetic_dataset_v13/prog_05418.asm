; DESCRIPTION: Draws a cyan line from (380, 248) to (263, 95).
; PLAN: r0=380(x1), r1=248(y1), r2=263(x2), r3=95(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 248
LDI r2, 263
LDI r3, 95
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
