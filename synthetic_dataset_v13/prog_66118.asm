; DESCRIPTION: Composite: Renders a red box of size 82x11 starting at (66, 239) then Draws a magenta line from (401, 111) to (285, 47).
; PLAN: r0=66(x), r1=239(y), r2=82(width), r3=11(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=401(x1), r6=111(y1), r7=285(x2), r8=47(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 66
LDI r1, 239
LDI r2, 82
LDI r3, 11
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 401
LDI r6, 111
LDI r7, 285
LDI r8, 47
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
