; DESCRIPTION: Composite: Renders a cyan box of size 27x67 starting at (113, 181) then Places a cyan dot at position (307, 170).
; PLAN: r0=113(x), r1=181(y), r2=27(width), r3=67(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=307(x), r6=170(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 113
LDI r1, 181
LDI r2, 27
LDI r3, 67
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 307
LDI r6, 170
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
