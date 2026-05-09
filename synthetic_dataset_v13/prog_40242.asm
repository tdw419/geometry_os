; DESCRIPTION: Draws a cyan line from (403, 134) to (420, 27).
; PLAN: r0=403(x1), r1=134(y1), r2=420(x2), r3=27(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 134
LDI r2, 420
LDI r3, 27
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
