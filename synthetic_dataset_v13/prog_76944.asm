; DESCRIPTION: Draws a cyan line from (480, 213) to (387, 12).
; PLAN: r0=480(x1), r1=213(y1), r2=387(x2), r3=12(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 480
LDI r1, 213
LDI r2, 387
LDI r3, 12
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
