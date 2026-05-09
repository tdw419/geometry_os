; DESCRIPTION: Composite: Places a green 107x11 rectangle at position (137, 111) then Places a magenta dot at position (213, 103).
; PLAN: r0=137(x), r1=111(y), r2=107(width), r3=11(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=213(x), r6=103(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 137
LDI r1, 111
LDI r2, 107
LDI r3, 11
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 213
LDI r6, 103
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
