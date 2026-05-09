; DESCRIPTION: Draws a cyan line from (422, 150) to (386, 146).
; PLAN: r0=422(x1), r1=150(y1), r2=386(x2), r3=146(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 150
LDI r2, 386
LDI r3, 146
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
