; DESCRIPTION: Composite: Sets a single cyan pixel at (346, 207) then Renders a yellow box of size 46x56 starting at (9, 150).
; PLAN: r0=346(x), r1=207(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=9(x), r6=150(y), r7=46(width), r8=56(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 346
LDI r1, 207
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 9
LDI r6, 150
LDI r7, 46
LDI r8, 56
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
