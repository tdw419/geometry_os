; DESCRIPTION: Renders a cyan box of size 90x105 starting at (386, 127).
; PLAN: r0=386(x), r1=127(y), r2=90(width), r3=105(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 127
LDI r2, 90
LDI r3, 105
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
