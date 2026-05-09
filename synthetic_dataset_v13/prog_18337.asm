; DESCRIPTION: Renders a cyan line between points (300, 164) and (30, 213).
; PLAN: r0=300(x1), r1=164(y1), r2=30(x2), r3=213(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 164
LDI r2, 30
LDI r3, 213
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
