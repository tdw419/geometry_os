; DESCRIPTION: Places a black 111x100 rectangle at position (242, 150).
; PLAN: r0=242(x), r1=150(y), r2=111(width), r3=100(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 150
LDI r2, 111
LDI r3, 100
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
