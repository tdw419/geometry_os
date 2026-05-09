; DESCRIPTION: Composite: Renders a green box of size 32x50 starting at (27, 59) then Places a magenta dot at position (307, 30).
; PLAN: r0=27(x), r1=59(y), r2=32(width), r3=50(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=307(x), r6=30(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 27
LDI r1, 59
LDI r2, 32
LDI r3, 50
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 307
LDI r6, 30
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
