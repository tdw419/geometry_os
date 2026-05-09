; DESCRIPTION: Places a red line segment connecting (386, 239) to (434, 167).
; PLAN: r0=386(x1), r1=239(y1), r2=434(x2), r3=167(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 239
LDI r2, 434
LDI r3, 167
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
