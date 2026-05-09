; DESCRIPTION: Composite: Places a cyan circle of radius 46 at center (244, 46) then Draws a cyan line from (161, 207) to (239, 27).
; PLAN: r0=244(x), r1=46(y), r2=46(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=161(x1), r6=207(y1), r7=239(x2), r8=27(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 244
LDI r1, 46
LDI r2, 46
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 161
LDI r6, 207
LDI r7, 239
LDI r8, 27
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
