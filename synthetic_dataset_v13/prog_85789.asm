; DESCRIPTION: Places a cyan line segment connecting (125, 206) to (464, 204).
; PLAN: r0=125(x1), r1=206(y1), r2=464(x2), r3=204(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 206
LDI r2, 464
LDI r3, 204
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
