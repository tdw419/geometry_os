; DESCRIPTION: Draws a cyan line from (215, 159) to (460, 57).
; PLAN: r0=215(x1), r1=159(y1), r2=460(x2), r3=57(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 159
LDI r2, 460
LDI r3, 57
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
