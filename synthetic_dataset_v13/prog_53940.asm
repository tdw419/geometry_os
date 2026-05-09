; DESCRIPTION: Renders a cyan line between points (319, 209) and (296, 215).
; PLAN: r0=319(x1), r1=209(y1), r2=296(x2), r3=215(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 209
LDI r2, 296
LDI r3, 215
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
