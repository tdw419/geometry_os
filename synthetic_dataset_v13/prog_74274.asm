; DESCRIPTION: Composite: Renders a orange box of size 94x26 starting at (237, 213) then Places a green dot at position (272, 61).
; PLAN: r0=237(x), r1=213(y), r2=94(width), r3=26(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=272(x), r6=61(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 237
LDI r1, 213
LDI r2, 94
LDI r3, 26
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 272
LDI r6, 61
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
