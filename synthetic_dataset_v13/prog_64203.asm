; DESCRIPTION: Draws a cyan line from (131, 204) to (228, 133).
; PLAN: r0=131(x1), r1=204(y1), r2=228(x2), r3=133(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 204
LDI r2, 228
LDI r3, 133
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
