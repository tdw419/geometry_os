; DESCRIPTION: Draws a cyan line from (265, 73) to (46, 174).
; PLAN: r0=265(x1), r1=73(y1), r2=46(x2), r3=174(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 73
LDI r2, 46
LDI r3, 174
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
