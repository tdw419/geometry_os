; DESCRIPTION: Draws a cyan line from (386, 182) to (502, 172).
; PLAN: r0=386(x1), r1=182(y1), r2=502(x2), r3=172(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 182
LDI r2, 502
LDI r3, 172
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
