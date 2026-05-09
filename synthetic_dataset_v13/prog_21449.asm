; DESCRIPTION: Renders a cyan line between points (206, 197) and (173, 162).
; PLAN: r0=206(x1), r1=197(y1), r2=173(x2), r3=162(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 197
LDI r2, 173
LDI r3, 162
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
