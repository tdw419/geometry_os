; DESCRIPTION: Renders a cyan line between points (215, 5) and (510, 174).
; PLAN: r0=215(x1), r1=5(y1), r2=510(x2), r3=174(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 5
LDI r2, 510
LDI r3, 174
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
