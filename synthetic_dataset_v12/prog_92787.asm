; DESCRIPTION: Composite: Places a yellow dot at position (456, 163) then Places a orange 10x86 rectangle at position (454, 154).
; PLAN: r0=456(x), r1=163(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=454(x), r6=154(y), r7=10(width), r8=86(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 456
LDI r1, 163
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 454
LDI r6, 154
LDI r7, 10
LDI r8, 86
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
