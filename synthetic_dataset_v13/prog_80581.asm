; DESCRIPTION: Renders a cyan box of size 44x20 starting at (467, 60).
; PLAN: r0=467(x), r1=60(y), r2=44(width), r3=20(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 467
LDI r1, 60
LDI r2, 44
LDI r3, 20
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
