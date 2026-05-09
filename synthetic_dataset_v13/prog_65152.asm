; DESCRIPTION: Renders a cyan box of size 82x83 starting at (154, 131).
; PLAN: r0=154(x), r1=131(y), r2=82(width), r3=83(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 131
LDI r2, 82
LDI r3, 83
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
