; DESCRIPTION: Renders a cyan box of size 56x44 starting at (394, 142).
; PLAN: r0=394(x), r1=142(y), r2=56(width), r3=44(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 142
LDI r2, 56
LDI r3, 44
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
