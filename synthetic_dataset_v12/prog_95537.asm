; DESCRIPTION: Renders a cyan box of size 18x90 starting at (354, 29).
; PLAN: r0=354(x), r1=29(y), r2=18(width), r3=90(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 29
LDI r2, 18
LDI r3, 90
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
