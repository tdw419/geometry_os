; DESCRIPTION: Composite: Renders a cyan box of size 54x33 starting at (266, 113) then Draws a cyan line from (244, 171) to (182, 247) then Places a magenta dot at position (313, 46).
; PLAN: r0=266(x), r1=113(y), r2=54(width), r3=33(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=244(x1), r6=171(y1), r7=182(x2), r8=247(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=313(x), r11=46(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 266
LDI r1, 113
LDI r2, 54
LDI r3, 33
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 244
LDI r6, 171
LDI r7, 182
LDI r8, 247
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 313
LDI r11, 46
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
