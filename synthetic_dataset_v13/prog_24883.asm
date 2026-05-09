; DESCRIPTION: Draws a cyan line from (426, 231) to (294, 113).
; PLAN: r0=426(x1), r1=231(y1), r2=294(x2), r3=113(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 231
LDI r2, 294
LDI r3, 113
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
