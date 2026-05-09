; DESCRIPTION: Composite: Places a yellow dot at position (146, 7) then Renders a cyan box of size 50x52 starting at (165, 71).
; PLAN: r0=146(x), r1=7(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=165(x), r6=71(y), r7=50(width), r8=52(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 146
LDI r1, 7
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 165
LDI r6, 71
LDI r7, 50
LDI r8, 52
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
