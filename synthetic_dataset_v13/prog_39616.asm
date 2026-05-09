; DESCRIPTION: Renders a white line between points (362, 82) and (502, 195).
; PLAN: r0=362(x1), r1=82(y1), r2=502(x2), r3=195(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 82
LDI r2, 502
LDI r3, 195
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
