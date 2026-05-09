; DESCRIPTION: Renders a cyan line between points (446, 195) and (215, 172).
; PLAN: r0=446(x1), r1=195(y1), r2=215(x2), r3=172(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 446
LDI r1, 195
LDI r2, 215
LDI r3, 172
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
