; DESCRIPTION: Composite: Places a yellow dot at position (288, 178) then Renders a cyan box of size 117x29 starting at (280, 226).
; PLAN: r0=288(x), r1=178(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=280(x), r6=226(y), r7=117(width), r8=29(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 288
LDI r1, 178
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 280
LDI r6, 226
LDI r7, 117
LDI r8, 29
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
