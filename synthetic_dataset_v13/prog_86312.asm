; DESCRIPTION: Draws a cyan line from (448, 239) to (479, 196).
; PLAN: r0=448(x1), r1=239(y1), r2=479(x2), r3=196(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 448
LDI r1, 239
LDI r2, 479
LDI r3, 196
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
