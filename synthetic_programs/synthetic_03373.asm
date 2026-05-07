; input driven program
; initialization
  LDI r11, 0x389207
  LDI r3, 1785
  LDI r2, 473
  LDI r5, 0xB32F14
  LDI r26, 3780
main_0:
  LDI r24, 64
  LDI r3, 3415
  LDI r7, 0xB7EC6F
  WPIXEL
  SHL r12, r13, r7
  SHR r5, r6, r9
  SAR r7, r6, r8
  SAR r8, r6, r3
  SHLI r3, r15, 0
  SHR r3, r15, r5
  FRAME
  JMP main_0
