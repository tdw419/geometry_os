; DESCRIPTION: Composite: Places a red dot at position (206, 135) then Renders a yellow box of size 79x29 starting at (267, 143).
; PLAN: r0=206(x), r1=135(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=267(x), r6=143(y), r7=79(width), r8=29(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 206
LDI r1, 135
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 267
LDI r6, 143
LDI r7, 79
LDI r8, 29
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
