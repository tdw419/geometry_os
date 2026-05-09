; DESCRIPTION: Renders a cyan box of size 12x53 starting at (405, 93).
; PLAN: r0=405(x), r1=93(y), r2=12(width), r3=53(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 93
LDI r2, 12
LDI r3, 53
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
