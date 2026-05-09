; DESCRIPTION: Composite: Renders a orange box of size 48x39 starting at (103, 165) then Sets a single cyan pixel at (337, 183).
; PLAN: r0=103(x), r1=165(y), r2=48(width), r3=39(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=337(x), r6=183(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 103
LDI r1, 165
LDI r2, 48
LDI r3, 39
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 337
LDI r6, 183
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
